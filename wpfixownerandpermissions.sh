!/bin/bash
set -ex

echo "which directory?"
read -p "directory: " WP_ROOT
echo "$WP_ROOT"

# reset to safe defaults
find "/var/www/html/blogs/$WP_ROOT" -exec chown www:wordpressftp {} \;
find "/var/www/html/blogs/$WP_ROOT" -type d -exec chmod 755 {} \;
find "/var/www/html/blogs/$WP_ROOT" -type f -exec chmod 644 {} \;

# allow wordpress to manage wp-config.php (but prevent world access)
chgrp webadmin "/var/www/html/blogs/$WP_ROOT/wp-config.php"
chmod 660 "/var/www/html/blogs/$WP_ROOT/wp-config.php"

# allow wordpress to manage wp-content
find "/var/www/html/blogs/$WP_ROOT/wp-content" -exec chgrp wordpressftp {} \;
find "/var/www/html/blogs/$WP_ROOT/wp-content" -type d -exec chmod 775 {} \;
find "/var/www/html/blogs/$WP_ROOT/wp-content" -type f -exec chmod 664 {} \;
