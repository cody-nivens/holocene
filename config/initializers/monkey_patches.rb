# Require all Ruby files in the core_extensions directory
Dir[Rails.root.join('lib', 'core_extensions', '*.rb')].each { |f| require f }

# Apply the monkey patches
#ActiveSupport.on_load(:action_text_rich_text) do
#  ActionText::RichText.include CoreExtensions::ActionText::RichText
#end

#ActiveSupport.on_load(:active_storage_attachment) do
#  ActiveStorage::Attachment.include CoreExtensions::ActiveStorage::Attachment
#end
