
# Install Apache
package "apache2" do
  action :install
end

# Enable and Start Apache
service "apache2" do
  action [:enable, :start]
end