namespace :maintenance do
  desc "Start maintenance mode"
  task start: :environment do
    File.write('public/maintenance.html', '<h1>Maintenance</h1><p>We are currently undergoing maintenance. Please check back later.</p>')
  end

  desc "Stop maintenance mode"
  task stop: :environment do
    File.delete('public/maintenance.html')
  end
end
