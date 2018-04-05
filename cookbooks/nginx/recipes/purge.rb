
service "nginx" do
  action :stop
end

package "nginx" do
  action :purge
end