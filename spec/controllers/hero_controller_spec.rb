require "rails_helper"
RSpec.describe HeroController do
  render_views

  describe "HeroesAPI" do



    it "create hero" do
    #  newhero = Hero.create
      #result = controller.create_hero
      post :create_hero

      newhero = Hero.last
      expect(newhero.custom_uuid).to be_truthy
    end

    it "load hero" do
       post :create_hero
       newhero = Hero.last
      #result = controller.create_hero
      post :load_hero, :params => {uuid: newhero.custom_uuid}

      p response.body
      expect(response).to be_truthy


    end

    it "save hero" do
      post :create_hero
      newhero = Hero.last

      sample_quest_array = [{name: 'startedquest', progress: 1},{name: 'finishedquest', progress: 2}]
      sample_perk_array = [{name: 'sampleperk', level: 1}]
      sample_spell_array = [{name: 'samplespell', learned: true}]
      sample_inventory_array = [{name: 'sampleinventory', slot_id: 1, item_id: 1, item_name: 'firstitem'}]

      post :save_hero, :params => {uuid: newhero.custom_uuid,
                                  quests: sample_quest_array,
                                  perks: sample_perk_array,
                                  spells: sample_spell_array,
                                  inventory_slots: sample_inventory_array}

      post :load_hero, :params => {uuid: newhero.custom_uuid}


      p response.body
      expect(response).to be_truthy


    end


  end
end