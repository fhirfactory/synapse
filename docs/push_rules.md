
==================================================================================================================
                                    Push rules configurations
==================================================================================================================

1. Default Push rules are configured and populated from `baserules.py` file. These four different default push notifications configurations are set and sent to client side application which consumes rules through matrix api. These rules would apply by default only if there is no config parameter provided which is `users_new_default_push_rules`.
- `BASE_APPEND_CONTENT_RULES`
- `BASE_PREPEND_OVERRIDE_RULES`
- `BASE_APPEND_OVERRIDE_RULES`
- `BASE_APPEND_UNDERRIDE_RULES`

2. As mentioned above, user can choose to have additional push rules configured by providing user id in configuration for which users need these new default configurations defined below. The flag used in homeserver config value is called `users_new_default_push_rules`. These new push rules which are under following two arrays below are also configured in `baserules.py` just as other push rules but new push rules are not applied if client does not provide list of userids. 
- `NEW_APPEND_UNDERRIDE_RULES`
- `NEW_APPEND_OVERRIDE_RULES`

3. A third implementation `BASE_CONFIGURED_OVERRIDE_RULE_IDS` has been introduced where client consuming api needs to provide a list of push notifications from default notification rules such as `m.rule.tombstone` as an example would need to be passed in list format which are read to override in `roomserver/baserule.py` as well as `server.py` and `pushrules.py` in `Get, PUT` api context to always be turned off.
BASE_CONFIGURED_OVERRIDE_RULE_IDS: 
  - '.m.rule.tombstone'
  - '.m.rule.encrypted'
  - '.m.rule.encrypted_room_one_to_one'

  Please look into corresponding front end applicatioon which consumes these push rules for more push rules definitions and what they mean. These push rules are either turned on, off or set to noisy in client side by default. There are other more than 10 push rules and the ones which needs to be disabled can be passed as parameter of flag `BASE_CONFIGURED_OVERRIDE_RULE_IDS` which is `List`. Roomserver converts `BASE_CONFIGURED_OVERRIDE_RULE_IDS` and uses configured value in `baserules.py` file to turn off push rules. Not providing any values in that list would automatically default all default push rules to matrix default ones. It also does not impact push rules specified in 2) which are controlled only by `users_new_default_push_rules` configured and combines both default rules as well as new rules configured through this flag.

