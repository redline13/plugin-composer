
# This is called prior to a test activation.
# Test agent is your server and no other tests are available.
# Test is executed as temporary user only available during the test.
function plugin_install() {

	# userHome dir is passed in as parameter.
	userHome=$1

	# Make sure composer is installed.
	if [ ! -f "/tmp/composer" ]; then
		curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp --filename=composer
	fi

	# Move into the users Home Dir
	cd $userHome

	# Composer update to install required packages.
	if [ -f "composer.json" ]; then
		/tmp/composer update --no-interaction
	fi

}
