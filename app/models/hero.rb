class Hero < ApplicationRecord

  require 'securerandom'

  has_many :quests
  has_many :perks
  has_many :spells
  has_many :inventory_slots


  enum faction: {
   nofaction: 0,
   elemental: 1,
   chaos: 2,
   arcane: 3,
   void: 4
 }


  def self.build_new_hero
    new_hero = Hero.new

    new_hero.custom_uuid = SecureRandom.uuid
    new_hero.faction = factions[:none]



    return new_hero
  end

end
