ActiveAdmin.register Order do
  index do
    column :purchaser do |o|
      link_to o.purchaser.name, admin_purchaser_path(o.purchaser)
    end
    column :item_description do |o|
      link_to o.item.description, admin_item_path(o.item)
    end
    column :item_price do |o|
      o.item.price
    end
    column :purchase_count
    column :merchant_address do |o|
      o.merchant.address
    end
    column :merchant_name do |o|
      link_to o.merchant.name, admin_merchant_path(o.merchant)
    end
    column :total
  end
  
  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
    total = Order.import_csv(params[:dump][:file])
    redirect_to :action => :index, :notice => "CSV imported successfully with a total revenue of #{total}!"
  end
  
  sidebar :total_gross_revenue do
    "#{Order.sum(:total)} dollars"
  end  

  # filter :purchase_count
end
