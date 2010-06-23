xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Lost Toys" 
    xml.description "Help Reunite children with lost toys" 
    xml.link formatted_toys_url(:rss)
    
    for toy in @toys
      xml.item do
        xml.title toy.title 
        xml.description toy.description 
        xml.pubDate toy.created_at.to_s(:rfc822) 
        xml.link formatted_toy_url(toy, :rss) 
        xml.guid formatted_toy_url(toy, :rss)
      end 
    end
  end
end