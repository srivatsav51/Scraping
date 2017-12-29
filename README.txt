Code developed by the following developers:
		Name					   PG-ID
1. Palaparthy Srivatsav			71721116
2. Ravi Kiran					71721085
3. Aditya Narayan				717212024

#######################################################################################################################################################################################

Approach Used to scrape the data from Yelp:

1. Regular expressions were used to scrape the data in the 1000 yelp.com webpages for the below fields:
   business name, business phone number, business home page URL, opening hours, Takes Reservations, Delivery, Take-out, Accepts Credit Cards, Accepts Apple Pay, Accepts Android Pay, Accepts Bitcoin, Good For, Parking, Bike Parking, Good for Kids, Good for
   Groups, Attire, Ambience, Noise Level, Alcohol, Outdoor Seating, Wi-Fi, Has TV, Caters, Gender Neutral Restrooms, contact-us URL,email ID

2. Rvest and Selector gadget tools were used to scrape data from yelp pages only for the business address field.

3. Rcrawler along with regular expressions were used to find contact-us page from a restaurant's homepage. Below example demonstrates the same:
		email_df<-Rcrawler(Website = "WEBSITE URL", no_cores = 4, no_conn = 4,
                           urlregexfilter =  c("contact","some other regex patterns"), DIR = "Directry to place the downloaded contact-us pages", MaxDepth=3)
	There are cases where rcrawler couldn't find a contact-us page, in such cases we have defaulted to the restaurant's homepage.
						   
4. Regular expressions along with StringR, Qdap packages were used to match the email pattern. The following regex pattern is used to get email IDs from webpages.
        ([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))
	There are cases where email IDs are present but disabled unless javascript is available, we can't scrape such emails.
	
######################################################################################################################################################################################
	
Instructions before running the code.

1. Use the source file given in the assignment. 
2. DO NOT COPY PASTE THE CODE AND THEN RUN IT. iT WILL JUST GIVE A BUNCH OF NA VALUES.
3. Install the required packages qdap,rvest,stringr,rcrawler,gtools and httr before running the code.
4. Give valid paths in path1,path2,path3 variable, the comments above those variables will explain what each path does.
5. Finally, to run the code select everything (press ctrl+A) and run (press ctrl+enter).
6. It will take roughly 4-hrs to run the code with a stable internet connection, see the progress bar to find out how much has been scraped so far.
		
		
		
		

                        

