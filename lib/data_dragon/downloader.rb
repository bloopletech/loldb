class DataDragon::Downloader
  def initialize
    @client = DataDragon::Client.new
  end

  def download
    return if online_version == local_version

    delete_data
    download_pack
    extract_pack
    remove_pack
    save_version
  end

  def delete_data
    Build.data_unpacked_path.rmtree
  end

  def download_pack
    Build.data_pack_path.open("w") do |file|
      @client.dragontail(online_version) do |chunk, remaining, total|
        file.write(chunk)
        puts "Downloading, remaining: #{remaining}, total: #{total}"
      end
    end
  end

  # untars the given IO into the specified
  # directory
  def extract_pack
    io = Zlib::GzipReader.new(Build.data_pack_path.open)

    Gem::Package::TarReader.new(io) do |tar|
      tar.each do |tarfile|
        destination_file = (Build.data_unpacked_path + tarfile.full_name)

        if tarfile.directory?
          destination_file.mkpath
        else
          destination_directory = destination_file.dirname
          destination_directory.mkpath unless destination_directory.directory?
          destination_file.write(tarfile.read)
        end
      end
    end
  end

  def remove_pack
    Build.data_pack_path.delete
  end

  def online_version
    @online_version ||= @client.realm["v"]
  end

  def local_version
    Build.version_path.read
  rescue
    nil
  end

  def save_version
    Build.version_path.write(online_version)
  end
end