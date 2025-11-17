# This file is a part of Redmine Login Obfuscator (redmine_login_obfuscator) plugin,
# login security plugin for Redmine
#
# Copyright (C) 2025-2026 Plugins4.own.pl
# https://plugins4.own.pl
#
# redmine_login_obfuscator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# redmine_login_obfuscator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with redmine_login_obfuscator.  If not, see <http://www.gnu.org/licenses/>.

REDMINE_LOGIN_OBFUSCATOR = '1.0.2'

Redmine::Plugin.register :redmine_login_obfuscator do
  name "Login obfuscator"
  author 'Plugins4 Own'  
  author_url 'https://plugins4.own.pl'
  description "Makes your login responses more unpredictable to brute-force bots. Adds a subtle security layer by sending an HTTP 403 Forbidden status on failed login attempts. This simple trick confuses brute-force bots that expect a 200 or 302 response and often makes them give up immediately."
  version REDMINE_LOGIN_OBFUSCATOR
end
Rails.logger.info "[RLO] Init start"

require_relative 'lib/redmine_login_obfuscator/patches/account_patch'

if defined?(AccountController)
  Rails.logger.info "[RLO] AccountController already defined – applying patch"
  RedmineLoginObfuscator::Patches::AccountPatch.apply
else
  # jeśli nie, podpinamy callback
  Rails.application.config.after_initialize do
    Rails.logger.info "[RLO] After initialize – applying patch"
    RedmineLoginObfuscator::Patches::AccountPatch.apply
  end
end