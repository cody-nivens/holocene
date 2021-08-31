class KeyWord < ApplicationRecord
  belongs_to :book

  validates :key_word, presence: true

def convert_thinking_sphinx
  results = ThinkingSphinx.search(self.key_word)

  items = results.collect{|x| (x.class.name == "ActionText::RichText" ? [x.record.class.name,(x.record.nil? ? [nil,nil,nil,nil,nil] : x.record.set_values)] : [x.class.name,x.set_values])}
  search_results = {}
  items.each do |item|
    next if item[1][0].nil?

    clazz = item[0].constantize
    if search_results[item[0]].nil?
      search_results[item[0]] = {}
    end

    indx0 = item[1][0].name
    if search_results[item[0]][indx0].nil?
      search_results[item[0]][indx0] = {}
    end
    indx1 = item[1][1].name unless item[1][1].nil?
    if !indx1.nil? && search_results[item[0]][indx0][indx1].nil?
      search_results[item[0]][indx0][indx1] = {}
    end
    indx2 = item[1][2].name unless item[1][2].nil?
    if !indx2.nil? && search_results[item[0]][indx0][indx1][indx2].nil?
      search_results[item[0]][indx0][indx1][indx2] = {}
    end
    indx3 = item[1][3].name unless item[1][3].nil?
    if !indx3.nil? && search_results[item[0]][indx0][indx1][indx2][indx3].nil?
      search_results[item[0]][indx0][indx1][indx2][indx3] = {}
    end
    indx4 = item[1][4]
    if !indx4.nil?
      search_results[item[0]][indx0][indx1][indx2][indx3][item[1][4].class.name] = item[1][4]
    elsif !indx3.nil?
      search_results[item[0]][indx0][indx1][indx2][item[1][3].class.name] = item[1][3]
    elsif !indx2.nil?
      search_results[item[0]][indx0][indx1][item[1][2].class.name] = item[1][2]
    elsif !indx1.nil?
      search_results[item[0]][indx0][item[1][1].class.name] = item[1][1]
    elsif !indx0.nil?
      search_results[item[0]][item[1][0].class.name] = item[1][0]
    end
  end
  return search_results
end
end
