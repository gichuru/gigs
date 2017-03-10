class InitialSchema < ActiveRecord::Migration[5.0]
  def change
  	create_table :gigs do |t|
  	t.string 	:name
  	t.text 		:description
  	t.integer :budget
  	t.date 		:startdate
  	t.integer	:duration
  	t.string 	:location
  	t.boolean :open, default: true
  	t.integer :awarded_internship
  	t.timestamps
  end

  	create_table :categories do |t|
  		t.string :name
  	end

  	create_table :skills do |t|
  		t.string	:name
  	end

    create_table :profiles do |t|
      t.string  :bio
      t.date  :age
      t.string  :phone
    end

    create_table :edus do |t|
      t.string  :sname
      t.date  :sdate
      t.date  :edate
      t.string  :course
      t.string  :description
    end

    create_table :companies do |t|
      t.string  :cname
      t.string  :category
      t.date  :sdate
      t.date  :edate
      t.string  :role
      t.string  :email
      t.string  :website
      t.string  :address
      t.text  :description
    end


  	create_table :proposals do |t|
  		t.text		:description
  		t.timestamps
  	end

  	create_table :abilities do |t|
  	end
  	
  	add_reference :gigs, :category, index: true
  	add_reference :proposals, :gig, index: true
  	add_reference	:abilities, :gig, index: true
  	add_reference	:abilities, :skill, index: true 
  end

end
