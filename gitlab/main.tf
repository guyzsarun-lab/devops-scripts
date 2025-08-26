locals {
  decoded_memberships = jsondecode(file("${path.module}/gitlab.json"))

  # Flatten the nested list of memberships into a single list
  flattened_memberships = flatten([
    for group_map in local.decoded_memberships : [
      for group_name, members in group_map : [
        for member_map in members : [
          for username, role in member_map : {
            group_name    = group_name
            user_username = username
            access_level  = role
          }
        ]
      ]
    ]
  ])

  group_memberships = {
    for member in local.flattened_memberships :
    "${member.group_name}-${member.user_username}" => member
  }
}

data "gitlab_group" "groups" {
  for_each = toset([
    for member in local.flattened_memberships : member.group_name
  ])
  full_path = each.key
}

data "gitlab_user" "users" {
  for_each = toset([
    for member in local.flattened_memberships : member.user_username
  ])
  username = each.key
}

resource "gitlab_group_membership" "group_members" {
  for_each = local.group_memberships

  group_id     = data.gitlab_group.groups[each.value.group_name].id
  user_id      = data.gitlab_user.users[each.value.user_username].id
  access_level = each.value.access_level
}
