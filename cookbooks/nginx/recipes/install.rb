
# Install Nginx
package "nginx" do
  action :install
end

# Enable and Start Nginx
service "nginx" do
  action [:enable, :start]
end