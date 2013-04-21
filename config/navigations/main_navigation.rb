SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false
  navigation.selected_class = nil
  navigation.active_leaf_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'main nav'

    primary.with_options(if: Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :add_neo,		'<i class="icon-plus icon-large"></i> Add a NEO', new_neo_path	
      #signed_in_user.item :dashboard, 	'Dashboard', root_path
    end

    primary.item :neos, '<i class="icon-list icon-large"></i> All NEOs', neos_path
    primary.item :random, '<i class="icon-refresh icon-large"></i> Random NEO', '/neos/random'
    primary.item :users, '<i class="icon-user icon-large"></i> Users', users_path
  end
end
