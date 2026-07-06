# This script acts as the "manager." between the app and database.
# Render runs this file every time the container wakes up.

#!/bin/bash

# 1. Start the MySQL database background service
service mariadb start

# 2. Give the database 3 seconds to fully boot up
sleep 5

# 3. Inject the(my) database structure and dummy data
mysql -u root < /init.sql

# 4. Start the Apache web server (this keeps the container running)
apache2-foreground