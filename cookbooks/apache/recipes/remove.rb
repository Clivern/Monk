
service "apache2" do
  action :stop
end

package "apache2" do
  action :remove
end