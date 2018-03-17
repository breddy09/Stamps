$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

require 'data_magic'
require 'yaml'
require 'rake'
require 'watir'
require 'mysql2'
require 'log4r'
require 'rspec'
require 'date'
require "set"
require 'fileutils'
require 'rbconfig'
require "csv"
require "rautomation"
require 'rubygems' # for compatibility with JRuby, MRI 1.8, etc
require 'open3'
require 'yaml'
require 'spreadsheet'
require 'measured'
require 'holidays'
require 'socket'

require_relative 'lib/core/ey_patch'
require_relative 'core/sdc_core'
require_relative 'lib/core/user_credentials'
require_relative 'lib/apps/registration_app'
require_relative 'lib/apps/pam_app'
require_relative 'lib/pam/pam_page_header'
require_relative 'lib/apps/stores_app'
require_relative 'helpers/test_helpers'
require_relative 'lib/apps/web_apps'
require_relative 'web_apps/core/web_apps'
require_relative 'lib/common/stamps_dot_com'
require_relative 'lib/orders/orders_modals'
require_relative 'lib/orders/orders'
require_relative 'lib/mail/mail_sign_in'
require_relative 'lib/orders/store_management'
require_relative 'lib/mail/print_form_panel_elements'
require_relative 'lib/mail/print_form_panel'


#require_relative 'lib/core/core/web_apps'
#require_relative 'lib/apps/_parameters'
#require_relative 'lib/apps/ers/test_helpers'
#require_relative 'web_apps/helpers/paramhelpers'
#require_relative 'lib/apps/ps'
#require_relative 'lib/apps/web_apps'
#
#
# # helper module
# require_relative 'lib/orders/fields'
# require_relative 'lib/mail/print_form_panel'
# require_relative 'lib/windows/print_window'
# require_relative 'lib/orders/store_management'
# require_relative 'lib/orders/general_settings'
# require_relative 'lib/windows/open_file'
# require_relative '../../features/support/lib/common/customs_information'

# require 'Win32API'
# require 'win32/registry.rb'

World Stamps
