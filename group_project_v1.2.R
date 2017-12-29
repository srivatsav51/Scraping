#Install these packages if you don't have them already
install.packages("httr")
install.packages("gtools")
install.packages("Rcrawler")
install.packages("stringr")
install.packages("qdap")
install.packages("rvest")
#=======================================================================================
#To run the code, give some valid paths below, select everything by using ctrl+A and run.
library(stringr)
library(qdap)
library(rvest)
library(httr)
library(Rcrawler)
library(gtools)
#=======================================================================================
#Path where the yelp pages are available
path1<-'E:\\Term 1\\Data collections\\assignmentData\\'
# destination path for the downloaded contact-us pages
path2<-"E:\\Term 1\\Data collections\\myrepo"
#results file will be placed here
path3<-"E:\\Term 1\\Data collections\\group_project\\results4.txt"
#=======================================================================================
Business_name<-c()
Business_phone_number<-c()
Business_homepage_URL<-c()
Business_Address<-c()
Opening_hours<-c()
Takes_Reservations<-c()
Delivery<-c()
TAKE_OUT<-c()
Accepts_Credit_Cards<-c()
Accepts_Apple_Pay<-c()
Accepts_Bitcoin<-c()
Good_For<-c()
Accepts_Android_Pay<-c()
Parking<-c()
Bike_Parking<-c()
Good_for_Kids<-c()
Good_for_Groups<-c()
Attire<-c()
Ambience<-c()
Noise_Level<-c()
Alcohol<-c()
Outdoor_Seating<-c()
Wi_Fi<-c()
Has_TV<-c()
Caters<-c()
Gender_Neutral_Restrooms<-c()
contact_US<-c()
emails<-c()
a1<-0
df<-data.frame()
#=======================================================================================
pb <- winProgressBar(title = "progress bar", min = 0,max = 1000, width = 600)
for (i in 1:1000) {
        html_pages<-c()
        html_pages <- paste(path1,i,'.html',sep = '')
        mypage <- readChar(html_pages, file.info(html_pages)$size)
        #=======================================================================================
        #Code for fetching Restaurant name starts here
        Business_name[i] <- str_match(mypage, '<h1 class="biz-page-title embossed-text-white shortenough">
            (.+?)
        </h1>')[2]
        if(invalid(Business_name[i])){
                Business_name[i] <- str_match(mypage, '<h1 class="biz-page-title embossed-text-white">
            (.+?)
        </h1>')[2]
               
        }
        #print(paste(i,'-->',Business_name[i]))
        
        #Code for fetching Restaurant name ends here
        #=======================================================================================
        #Code for fetching Restaurant mobile numbers starts here
       
        Business_phone_number[i] <- str_match(mypage, '<span itemprop="telephone">
        (.+?)
    </span>')[2]
       # print(Business_phone_number[i])
        
        #Code for fetching Restaurant mobile number ends here
        #=======================================================================================        #Code for fetching Restaurant Website starts here
        # homepage <- read_html(html_pages) %>% html_node(".biz-website a") %>% html_text()
        # 
        # homepage<-gsub("\n","",homepage)
        # if(!invalid(homepage)){
        #         Business_homepage_URL[i]<-homepage
        # }
        
        Business_homepage_URL[i] <- str_match(mypage, '<span class="offscreen">Business website</span>
        <a href="(.+?)">(.+?)</a>
    </span>')[3]
       # print(Business_homepage_URL[i])
        #Code for fetching Restaurant Website ends here
        #=======================================================================================        #Code for fetching Restaurant Address starts here
        Address1 <- read_html(html_pages) %>% html_node(".u-space-l4") %>% html_text()
        Address1<-gsub("\n","",Address1)
        if(!invalid(Address1)){
                Address1<-str_trim(clean(Address1))
                Business_Address[i]<-Address1
                
        }
        
        #Code for fetching Restaurant Address ends here
      #=======================================================================================
        #Code for fetching if the Opening Hours of the Restaurant starts here        
    a1 <- str_match(mypage, '<tr>
        <th scope="row">Mon</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
 
        a2 <- str_match(mypage, '<tr>
        <th scope="row">Tue</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
        a3 <- str_match(mypage, '<tr>
        <th scope="row">Wed</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
        
        a4 <- str_match(mypage, '<tr>
        <th scope="row">Thu</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
        a5 <- str_match(mypage, '<tr>
        <th scope="row">Fri</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
a6 <- str_match(mypage, '<tr>
        <th scope="row">Sat</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
a7 <- str_match(mypage, '<tr>
        <th scope="row">Sun</th>
        <td>
            <span class="nowrap">(.+?)</span> - <span class="nowrap">(.+?)</span>
        </td>
        <td class="extra">
        </td>
    </tr>')
oh1<-paste('Mon','-->',a1[length(a1)-1],'-',a1[length(a1)],';'
           ,'Tue','-->',a2[length(a2)-1],'-',a2[length(a2)],';'
           ,'Wed','-->',a3[length(a3)-1],'-',a3[length(a3)],';'
           ,'Thu','-->',a4[length(a4)-1],'-',a4[length(a4)],';'
           ,'Fri','-->',a5[length(a5)-1],'-',a5[length(a5)],';'
           ,'Sat','-->',a6[length(a6)-1],'-',a6[length(a6)],';'
           ,'Sun','-->',a7[length(a7)-1],'-',a7[length(a7)],';')

Opening_hours[i]<-oh1
#Code for fetching if the Opening Hours of the Restaurant ends here
        #=======================================================================================
       #Code for fetching if the Restaurant Takes Reservations starts here
        Takes_Reservations[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Takes Reservations
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant Takes Reservations ends here
        #=======================================================================================
        #Code for fetching what the Restaurant allows Delivery starts here
        Delivery[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Delivery
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant allows Delivery ends here
        #=======================================================================================
        #Code for fetching what the Restaurant allows Take-out starts here
        TAKE_OUT[i]<- str_match(mypage, '<dt class="attribute-key">
                                    Take-out
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant allows Take-out ends here
        #=======================================================================================
        #Code for fetching what the Restaurant Accepts Credit Cards starts here
        Accepts_Credit_Cards[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Accepts Credit Cards
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant Accepts Credit Cards ends here
        #=======================================================================================
        #Code for fetching what the Restaurant Accepts Apple Pay starts here
        Accepts_Apple_Pay[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Accepts Apple Pay
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant Accepts Android Pay ends here
        #=======================================================================================
        #Code for fetching what the Restaurant Accepts Android Pay starts here
        Accepts_Android_Pay[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Accepts Android Pay
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant Accepts Android Pay ends here
        #=======================================================================================
        #Code for fetching what the Restaurant Accepts Bitcoin starts here
        Accepts_Bitcoin[i] <- str_match(mypage, 'dt class="attribute-key">
                                    Accepts Bitcoin
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant Accepts Bitcoin ends here
        #=======================================================================================
        #Code for fetching what the Restaurant is Good For starts here
        Good_For[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Good For
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching what the Restaurant is Good For ends here
        #=======================================================================================
        #Code for fetching if the Restaurant has Bike Parking or not starts here
        Parking[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Parking
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant has Parking or not ends here
        #=======================================================================================
        #Code for fetching if the Restaurant has Bike Parking or not starts here
        Bike_Parking[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Bike Parking
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant has Bike Parking or not ends here
        #=======================================================================================
        #Code for fetching if the Restaurant is Good for Kids or not starts here
        Good_for_Kids[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Good for Kids
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant is Good for Kids or not ends here
        #=======================================================================================
        #Code for fetching if the Restaurant is Good for groups or not starts here
        Good_for_Groups[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Good for Groups
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if the Restaurant is Good for groups or not ends here
        #=======================================================================================
        #Code for fetching the Attire details starts here
        Attire[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Attire
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching the Attire details ends here
        #=======================================================================================
        #Code for fetching the Ambience details starts here
        Ambience[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Ambience
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching Ambience details ends here
        #=======================================================================================
        #Code for fetching the Noise Level details starts here
        Noise_Level[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Noise Level
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching the Noise Level details ends here
        #=======================================================================================
        #Code for fetching if Restaurant has Alcohol or not starts here
        Alcohol[i]<- str_match(mypage, '<dt class="attribute-key">
                                    Alcohol
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if Restaurant has Alcohol or not ends here
        #=======================================================================================
        #Code for fetching if Restaurant has Outdoor seating or not starts here
        Outdoor_Seating[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Outdoor Seating
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if Restaurant has Outdoor seating or not ends here
        #=======================================================================================
        #Code for fetching if Restaurant has WIFI or not starts here
        Wi_Fi[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Wi-Fi
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if Restaurant has WIFI or not ends here
        #=======================================================================================
        #Code for fetching if Restaurant has TV or not starts here
        Has_TV[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Has TV
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if Restaurant has TV or not ends here
        #=======================================================================================
        #Code for fetching if Restaurant caters or not starts here
        Caters[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Caters
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        #Code for fetching if Restaurant caters or not ends here
        #=======================================================================================
        #Code for fetching if Restaurant has Gender Netral Rest Rooms starts here
        Gender_Neutral_Restrooms[i] <- str_match(mypage, '<dt class="attribute-key">
                                    Gender Neutral Restrooms
                            </dt>
                            <dd>
                                (.+?)
                            </dd>')[2]
        
        #Code for fetching if Restaurant has Gender Netral Rest Rooms ends here
        #=======================================================================================
        #Code for fetching email and contact us pages starts here
        if(!invalid(Business_homepage_URL[i])){
                tryCatch({
                        
                        if(i==425){
                               # thepage <- readLines(GET(as.character(Business_homepage_URL[i]))$url)
                                
                               # emails1 <- unlist(regmatches(thepage, gregexpr("([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))", thepage)))
                                
                                
                                email_df<-Rcrawler(Website = GET("http://www.juiceshop.com/")$url, no_cores = 4, no_conn = 4,
                                                   urlregexfilter =  c("contact","new-page-2","location-contact","3rdcousincatering","connect"), DIR = path2, MaxDepth=2)
                                }else{ 
                               # thepage <- readLines(GET(as.character(Business_homepage_URL[i]))$url)
                                
                                #emails1 <- unlist(regmatches(thepage, gregexpr("([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))", thepage)))
                                
                                email_df<-Rcrawler(Website = GET(as.character(Business_homepage_URL[i]))$url, no_cores = 4, no_conn = 4,
                                                   urlregexfilter =  c("contact","new-page-2","location-contact","3rdcousincatering","connect"), DIR = path2, MaxDepth=2)
                                
                                }
                        if(!invalid(email_df)){
                                contact_US[i]<-email_df$Url
                                
                        }else{
                                contact_US[i]<-GET(as.character(Business_homepage_URL[i]))$url
                        }
                        thepage <- readLines(GET(contact_US[i])$url)
                        
                        emails1 <- unlist(regmatches(thepage, gregexpr("([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))", thepage)))
                        
                         
                         e_list<-str_c(unique(emails1),collapse=', ')
                        if(!invalid(e_list)){
                                emails[i]<-e_list
                        }else{
                                emails[i]<-NA
                        }
                        
                },error=function(cond) {
                        
                        contact_US[i]<-Business_homepage_URL[i]
                        #print(paste(i,"+++>",contact_US[i]))
                     
                                emails[i]<-NA
                        
                })
        }else{
                
                contact_US[i]<-NA
                emails[i]<-NA
        }  

        #Code for fetching email and contact us pages ends here
        #=======================================================================================
setWinProgressBar(pb, i, title=paste('You are stuck with me for 3 to 4 hrs, why dont you relax while I scrape :)','-->',round(i/1000*100, 0),"% done so far"))

}
close(pb)
df <- rbind(df, data.frame(Business_name))
df <- cbind(df, data.frame(Business_phone_number))
df <- cbind(df, data.frame(Business_homepage_URL))
df <- cbind(df, data.frame(Business_Address))
df <- cbind(df, data.frame(Opening_hours))
df$Opening_hours <- gsub("<[^>]+>", "", df$Opening_hours)
df <- cbind(df, data.frame(Takes_Reservations))
df <- cbind(df, data.frame(Delivery))
df <- cbind(df, data.frame(TAKE_OUT))
df <- cbind(df, data.frame(Accepts_Credit_Cards))
df <- cbind(df, data.frame(Accepts_Apple_Pay))
df <- cbind(df, data.frame(Accepts_Android_Pay))
df <- cbind(df, data.frame(Accepts_Bitcoin))
df <- cbind(df, data.frame(Good_For))
df <- cbind(df, data.frame(Parking))
df <- cbind(df, data.frame(Bike_Parking))
df <- cbind(df, data.frame(Good_for_Kids))
df <- cbind(df, data.frame(Good_for_Groups))
df <- cbind(df, data.frame(Attire))
df <- cbind(df, data.frame(Ambience))
df <- cbind(df, data.frame(Noise_Level))
df <- cbind(df, data.frame(Alcohol))
df <- cbind(df, data.frame(Outdoor_Seating))
df <- cbind(df, data.frame(Wi_Fi))
df <- cbind(df, data.frame(Has_TV))
df <- cbind(df, data.frame(Caters))
df <- cbind(df, data.frame(Gender_Neutral_Restrooms))
df <- cbind(df, data.frame(contact_US))
df <- cbind(df, data.frame(emails))


#write.csv(file='E:\\Term 1\\Data collections\\group_project\\yelpsf31.csv', x=df)
write.table(df, file = path3, 
            append = TRUE, sep = "\t", row.names=FALSE, col.names=TRUE, quote=FALSE)

