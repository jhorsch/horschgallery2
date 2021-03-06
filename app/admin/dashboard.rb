ActiveAdmin.register_page "Dashboard" do

    menu :parent => "Misc", :priority => 11

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent Posts" do
          ul do
            Cart.all.take(30).each do |cart|
              # li link_to(cart.id, order_path(order))
              li cart.id
            end
          end
        end
      end


    end
  end # content
end
