class ContactTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: "6:00 AM - 9:00 AM" },
    { id: 3, name: "9:00 AM - 12:00 PM" },
    { id: 4, name: "12:00 PM - 3:00 PM" },
    { id: 5, name: "3:00 PM - 6:00 PM" },
    { id: 6, name: "6:00 PM - 9:00 PM" },
    { id: 7, name: "9:00 PM - 12:00 AM" },
    { id: 8, name: "12:00 AM - 3:00 AM" },
    { id: 9, name: "3:00 AM - 6:00 AM" },
    { id: 10, name: "その他" }
  ]

  include ActiveHash::Associations
  has_many :users
end