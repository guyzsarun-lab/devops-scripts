❯ kubectl get secret secret -o json | jq -r '.data | map_values(@base64d)'

# {
#   "PAPERLESS_CSRF_TRUSTED_ORIGINS": "********",
#   "PAPERLESS_DBENGINE": "********",
#   "PAPERLESS_DBHOST": "********",
#   "PAPERLESS_DBNAME": "********",
#   "PAPERLESS_DBPASS": "********",
# }