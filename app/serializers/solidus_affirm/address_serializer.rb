require 'active_model_serializers'

module SolidusAffirm
  class AddressSerializer < ActiveModel::Serializer
    attributes :name, :address
    self.root = false

    def name
      {
        first: object.firstname,
        last: object.lastname
      }
    end

    def address
      {
        line1: object.address1,
        line2: object.address2,
        city: object.city,
        state: object.state.abbr,
        zipcode: object.zipcode,
        country: object.country.iso3
      }
    end
  end
end
