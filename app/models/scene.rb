class Scene < ApplicationRecord
  include SharedMethods
  include Rails.application.routes.url_helpers
  #include RankedModel

  ThinkingSphinx::Callbacks.append(
    self, behaviours: [:sql]
  )
  # if you're using namespaced models:
  ThinkingSphinx::Callbacks.append(
    self, 'action_text/rich_text', behaviours: [:sql]
  )

  belongs_to :book
  belongs_to :key_point, optional: true
  acts_as_list scope: :key_point
  #ranks :position, with_same: [:key_point_id, :selector]

  belongs_to :artifact, optional: true
  belongs_to :situated, polymorphic: true
  belongs_to :insert_scene, class_name: :Scene, optional: true

  has_rich_text :summary
  has_rich_text :place
  has_rich_text :goal_reaction
  has_rich_text :conflict_dilemma
  has_rich_text :disaster_decision
  has_rich_text :short_term_goal
  has_rich_text :long_term_goal
  has_rich_text :over_arching_goal

  has_one :action_text_rich_text,
          class_name: 'ActionText::RichText',
          as: :record

  has_many :character_scenes, dependent: :destroy
  has_many :characters, through: :character_scenes

  has_one :section, as: :sectioned, dependent: :destroy
  has_many :signets, as: :sigged, dependent: :destroy
  #has_many :tours, dependent: :destroy

  delegate :abc, to: :insert_scene, prefix: true
  delegate :name, to: :artifact, prefix: true

  validates :abc, presence: true

  def title_scene?
    title_scene
  end

  def set_prev
    prev_item = higher_item
    if prev_item.nil?
      key_point = self.key_point.set_prev
      return nil if key_point.nil?

      prev_item = key_point.scenes.order(:position).last
      return nil if prev_item.nil?
    end
    prev_item
  end

  def set_next
    next_item = lower_item
    if next_item.nil?
      key_point = self.key_point.set_next
      return nil if key_point.nil?

      next_item = key_point.scenes.order(:position).first
      return nil if next_item.nil?
    end
    next_item
  end

  def mk_date
    info = time_to_array

    year = info[0]
    month = info[1]
    day = info[2]
    hour = info[2]
    minute = info[2]

    { year: year.to_i.to_s, month: month.to_i.to_s, day: day.to_i.to_s, hour: hour.to_i.to_s, minute: minute.to_i.to_s }
  end

  # Generate json for TimelineJS
  #
  def slide
    { start_date: mk_date,
      end_date: mk_date,
      group: key_point.scripted.name,
      text: mk_text(summary, name) }
  end

  def full_name
    "#{abc}:#{section.present? ? section.name : summary.to_plain_text[0..99]}"
  end

  def name
    if summary.blank?
      abc
    else
      summary.to_plain_text[0..99].to_s
    end
  end

  def plain_name
    # "#{self.summary.to_plain_text[0..99]}"
    summary.to_plain_text.to_s
  end

  def word_count
    (section.nil? ? 0 : section.word_count)
  end

  def self.get_scenes(situated, toggle = "off", scene_year = nil, force: false)
    if !force
      stories = nil
      val = nil
      values = {}
      if situated.instance_of?(Book)
        val = $redis.get("book_scenes_#{situated.id}")
      else
        val = $redis.get("story_scenes_#{situated.id}")
      end
      unless val.blank?
        values = ActiveSupport::JSON.decode(val)

        new_values = {}
        values.keys.sort.each do |year|
          values[year].keys.sort.each do |month|
            values[year][month].keys.sort.each do |day|
              values[year][month][day].keys.sort.each do |hour|
                values[year][month][day][hour].keys.sort.each do |minute|
                  if new_values[year.to_i].nil?
                    new_values[year.to_i] = {}
                  end
                  if new_values[year.to_i][month.to_i].nil?
                    new_values[year.to_i][month.to_i] = {}
                  end
                  if new_values[year.to_i][month.to_i][day.to_i].nil?
                    new_values[year.to_i][month.to_i][day.to_i] = {}
                  end
                  if new_values[year.to_i][month.to_i][day.to_i][hour.to_i].nil?
                    new_values[year.to_i][month.to_i][day.to_i][hour.to_i] = {}
                  end
                  if new_values[year.to_i][month.to_i][day.to_i][hour.to_i][minute.to_i].nil?
                    new_values[year.to_i][month.to_i][day.to_i][hour.to_i][minute.to_i] = {}
                  end
                  new_values[year.to_i][month.to_i][day.to_i][hour.to_i][minute.to_i] = values[year][month][day][hour][minute]
                end
              end
            end
          end
        end

        return new_values
      end
    end
      stories = if situated.instance_of?(Book)
                  situated.stories.where(stand_alone: false, publish: true)
                else
                  [situated]
                end

      scenes_h = {}
      stories.each do |story|
        story.key_points.each do |key_point|
          key_point.scenes.each do |scene|
            date = scene.date_string.to_date
            my_info = scene.time_to_array
            year = my_info[0]
            month = my_info[1]
            day = my_info[2]
            hour = my_info[3]
            minute = my_info[4]
            next if !scene_year.nil? && scene_year.to_i != year

            scenes_h[year] = {} if scenes_h[year].nil?
            scenes_h[year][month] = {} if scenes_h[year][month].nil?
            scenes_h[year][month][day] = {} if scenes_h[year][month][day].nil?
            scenes_h[year][month][day][hour] = {} if scenes_h[year][month][day][hour].nil?
            scenes_h[year][month][day][hour][minute] = [] if scenes_h[year][month][day][hour][minute].nil?

            scenes_h[year][month][day][hour][minute] << scene.id
            #unless scenes_h[year][month][day][hour][minute].include?(scene)
          end
        end
      end

      if situated.instance_of?(Book)
        $redis.set("book_scenes_#{situated.id}", scenes_h.to_json)
      else
        $redis.set("story_scenes_#{situated.id}", scenes_h.to_json)
      end

    return scenes_h

  end

  def self.get_scenes_to_array(situated, toggle = "off", scene_year = nil)
    scenes = get_scenes(situated, toggle, scene_year)
    items = []
    scenes.keys.sort.each do |year|
      scenes[year].keys.sort.each do |month|
        scenes[year][month].keys.sort.each do |day|
          scenes[year][month][day].keys.sort.each do |hour|
            scenes[year][month][day][hour].keys.sort.each do |minute|
              scenes[year][month][day][hour][minute].each do |scene|
                items << scene unless items.include?(scene)
              end
            end
          end
        end
      end
    end
    return items
  end

  def self.get_scenes_wi_to_array(situated, toggle = "off", scene_year = nil)
    scenes = get_scenes(situated, toggle, scene_year)
    items = []
    inserted_scenes = []
    scenes.keys.sort.each do |year|
      scenes[year].keys.sort.each do |month|
        scenes[year][month].keys.sort.each do |day|
          scenes[year][month][day].keys.sort.each do |hour|
            scenes[year][month][day][hour].keys.sort.each do |minute|
              scenes[year][month][day][hour][minute].each do |scene|
               next if inserted_scenes.include?(scene)
               insert_scenes = Scene.where(insert_scene_id: scene)
               insert_scenes.each do |iscene|
                 next if inserted_scenes.include?(iscene.id)
                 next unless iscene.key_point.scripted.publish?
                 inserted_scenes << iscene.id
                 items << iscene.id
               end

                items << scene unless items.include?(scene)
              end
            end
          end
        end
      end
    end
    return items
  end

  def time_to_array
    t_parts = date_string.split('-')
    year = t_parts[0].to_i
    month = t_parts[1].to_i
    day = t_parts[2].to_i
    hour = t_parts[3].to_i
    minute = t_parts[4].to_i
    [year, month, day, hour, minute]
  end

  def time_to_text
    info = time_to_array

    s = (info[0]).to_s
    return  "#{s}y " if info[1] == '' && info[2] == '' && info[3] == '' && info[4] == ''

    s += 'y '
    s += "#{info[1]}m "
    s += "#{info[2]}d "
    s += "#{info[3]}h "
    s += "#{info[4]}M"
    s
  end

  def min
    date_string[0..3].to_i
  end

  def max
    date_string[0..3].to_i
  end

  def set_values
    story = key_point = book = nil
    case situated_type
    when 'Story'
      story = self.situated
      key_point = self.key_point
      book = story.book
    end
    [book, story, key_point, self, nil]
  end

  def book
    story = situated
    story.book
  end
end
