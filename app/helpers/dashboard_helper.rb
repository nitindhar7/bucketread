module DashboardHelper
  
  def no_pages
    return true if @unlocked_pages.length + @locked_pages.length == 0
  end
  
end
