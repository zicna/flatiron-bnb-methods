class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
    openings = []
    checkin = Date.parse date1
    checkout = Date.parse date2

    self.listings.each do |listing|
      listing.reservations.each do |reservation|
        if reservation.checkin >= checkout || reservation.checkout <= checkin
            openings << listing
        end
      end
    end
    openings
  end

end

