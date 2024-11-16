# Directory to search for .sh files
FEATURES_DIR=./features
SHELL_CONFIG_FEATURES=$HOME/.shell_config_features.sh

# wipe old configs
echo "# WARNING: This file is automatically generated. Do not edit manually." >$SHELL_CONFIG_FEATURES
sudo chmod +x $SHELL_CONFIG_FEATURES

# Search every config.sh in every directory
for file in $(find "$FEATURES_DIR" -type f -name "config.sh"); do
  echo "$file "
  cat $file >>$SHELL_CONFIG_FEATURES
done
