bash "get started with the bare essentials" do
  code "apt-get update"
  code "apt-get install -y git"
end

class ::Helper
  def self.home(path="")
    File.join("/home/vagrant", path)
  end
end
