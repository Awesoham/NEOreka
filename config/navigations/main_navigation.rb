SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false
  navigation.selected_class = nil
  navigation.active_leaf_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'main nav'

    primary.with_options(if: Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :add_neo,		'Add a NEO', new_neo_path	
      signed_in_user.item :dashboard, 	'Dashboard', root_path
    end

    primary.item :neos, 'All NEOs', neos_path
    primary.item :users, 'Users', users_path
  end
end
