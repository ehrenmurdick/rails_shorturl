desc "Remove links which haven't been used in a while (30 days), to keep the maximum link length down"
task "links:stale:kill" => "environment" do
  ActiveRecord::Base.connection.execute("DELETE FROM links WHERE updated_at < '#{(Time.now - 30.days).to_s(:db)}'")
end
