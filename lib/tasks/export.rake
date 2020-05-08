namespace :export do
  desc 'Prints Barbers.all in a seeds.rb way.'
  task seeds_format: :environment do
    Barber.order(:id).all.each do |barber|
      puts "Barber.create(#{barber.serializable_hash.delete_if { |key, _value| %w[created_at updated_at id].include?(key) }.to_s.gsub(/[{}]/, '')})"
    end
  end
end
