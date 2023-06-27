require "active_support"

module CFRakeHelper
  def say(message)
    puts message unless Rake.application.options.silent
  end
end

namespace :check_fixtures do
  task :check_dependencies do
    #include GraphViz::Utils
    #unless find_executable("dot", nil)
    #  raise "Unable to find GraphViz's \"dot\" executable. Please " \
    #        "visit https://voormedia.github.io/rails-erd/install.html for installation instructions."
    #end
  end

  task :options do
    #(RailsERD.options.keys.map(&:to_s) & ENV.keys).each do |option|
    #  RailsERD.options[option.to_sym] = case ENV[option]
    #  when "true", "yes" then true
    #  when "false", "no" then false
    #  when /,/ then ENV[option].split(/\s*,\s*/)
    #  when /^\d+$/ then ENV[option].to_i
    #  else
    #    if option == 'only'
    #      [ENV[option]]
    #    else
    #      ENV[option].to_sym
    #    end
    #  end
    #end
  end

  task :load_models do
    include CFRakeHelper

    say "Loading application environment..."
    Rake::Task[:environment].invoke

    say "Loading code in search of Active Record models..."
    begin
      Rails.application.eager_load!

      if Rails.application.respond_to?(:config) && !Rails.application.config.nil?
        Rails.application.config.eager_load_namespaces.each(&:eager_load!) if Rails.application.config.respond_to?(:eager_load_namespaces)
      end
    rescue Exception => err
      if Rake.application.options.trace
        raise
      else
        trace = Rails.backtrace_cleaner.clean(err.backtrace)
        error = (["Loading models failed!\nError occurred while loading application: #{err} (#{err.class})"] + trace).join("\n    ")
        raise error
      end
    end

    raise "Active Record was not loaded." unless defined? ActiveRecord
  end

  task :generate => [:check_dependencies, :options, :load_models] do
    include CFRakeHelper

    say "Generating Fixture report for #{ActiveRecord::Base.descendants.length} models..."

    #ActiveRecord::Base.connection.tables.map do |model|
    ActiveRecord::Base.descendants.each do |model|
      next if ["ApplicationRecord", "ActionMailbox::Record", "ActionMailbox::InboundEmail", "ActiveStorage::Record",
               "ActiveStorage::Attachment", "ActiveStorage::Blob", "ActiveStorage::VariantRecord", "ActionText::Record",
               "ActionText::RichText"].include?(model.name)
      next if model.name =~ /HABTM_/
      if File.exists?("#{Rails.root}/test/fixtures/#{model.name.underscore.pluralize}.yml")
        printed_model_name = false
        data = YAML.load(ERB.new(File.read("#{Rails.root}/test/fixtures/#{model.name.underscore.pluralize}.yml")).result,
                         permitted_classes: [ActiveSupport::TimeZone, ActiveSupport::TimeWithZone, Time, Symbol, Date],
                         aliases: true  )
        data.keys.each do |key|
          model.attribute_names.each do |attribute|
            next if ["id", "created_at", "updated_at"].include?(attribute)

            next if data[key].keys.include?(attribute)

            reflect_found = false

            column = model.column_for_attribute(attribute.to_sym)
            if (model.type_for_attribute(attribute.to_sym).instance_of?(ActiveModel::Type::Boolean) and (column.default == "0" or column.default == "1")) or
                (model.type_for_attribute(attribute.to_sym).instance_of?(ActiveModel::Type::Integer) and !column.default.nil?) or
                model.type_for_attribute(attribute.to_sym).instance_of?(ActiveModel::Type::String)
              reflect_found = true
            end

            reflections = model.reflect_on_all_associations
            reflections.each do |reflection|
              #debugger
              #if (reflection.constructable? and reflection.name.to_s == attribute.gsub(/_id/,'')) or
              if (reflection.name.to_s == attribute.gsub(/_id/,'')) or
                  reflection.name.to_s == attribute.gsub(/_id/,'') or
                  reflection.name.to_s == attribute.gsub(/_type/,'')
                reflect_found = true
              end
            end
            unless reflect_found
              unless printed_model_name
                puts model.name
                printed_model_name = true
              end
              puts "  #{key}: #{attribute}"
            end
          end
        end

      end
    end


    say "Done! Saved report to ./#{file}"
  end
end

desc "Generate an report on missing fixture data based on your models"
task :check_fixtures => "check_fixtures:generate"
