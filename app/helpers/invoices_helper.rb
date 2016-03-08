# == Schema Information
#
# Table name: invoices
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  emission_date :date
#  begin_date    :date
#  end_date      :date
#  amount_ht     :float
#  amount_ttc    :float
#  paid_status   :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

module InvoicesHelper
end
