#!/bin/bash -e


# # # # # #
#
#   cronjob to renew cerbot certificates
#
#   v20230512.1448
#   Added by Ansible {{ ansible_date_time.date }} {{ansible_date_time.time}}
#
# # # # # #


echo "$(date +%Y%m%d:%H%M%S): Stopping nginx service";

systemctl stop nginx;

echo "$(date +%Y%m%d:%H%M%S): Running certbot renew";

certbot renew;

echo "$(date +%Y%m%d:%H%M%S): Starting nginx service";

systemctl start nginx;

echo "Script completed in:";

times;

exit 0;
