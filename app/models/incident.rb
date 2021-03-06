# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :text
#  date          :datetime
#  journalist_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Incident < ActiveRecord::Base
  has_many :incident_reports
  has_many :person_reports
  has_many :journalists, through: :incident_reports
  has_many :suspects, through: :person_reports, source: :person, source_type: 'Suspect'
  has_many :victims, through: :person_reports, source: :person, source_type: 'Victim'
end
