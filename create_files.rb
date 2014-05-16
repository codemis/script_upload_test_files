# This file is part of Upload Test Files.
# 
# Upload Test Files is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Joshua Project API is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see 
# <http://www.gnu.org/licenses/>.
# 
# @author Johnathan Pulos <johnathan@missionaldigerati.org>
# @license http://opensource.org/licenses/gpl-license.php GNU Public License

# Files Sizes (Mb)

min_size = 10
max_size = 300
file_prefix = 'upload_me'
file_ext = 'txt'

dir = File.join(Dir.pwd, 'test_files')

(min_size..max_size).step(10) do |n|
  new_file_name = "#{file_prefix}_#{n}.#{file_ext}"
  new_file = File.join(dir, new_file_name)
  file_size = n * 1000000
  system "dd if=/dev/zero of=#{new_file} bs=#{file_size} count=1"
  puts "Created file #{new_file_name} at #{n}Mb"
end