class Tax < ActiveRecord::Base
    
    validates :user_name, presence: true
    validates :user_vorname, presence: true
    validates :user_pw, presence: true

    validates :brutto, numericality: true
    validates :pk_p, numericality: true    
    validates :kv, numericality: true    
    validates :steuer_fw, numericality: true
    validates :soli_fw, numericality: true    
    validates :kirche_fw, numericality: true    
    validates :kurs, numericality: true    
end
