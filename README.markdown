BucketRead
==========
Save interesting pages so you can read them later.

How do I get started?
---------------------
Simply sign up for a free account with your email and get going. Download the extension here or from the Chrome Webstore.

How is it different?
--------------------
Browser bookmarks and services like Delicious are either used to save frequently visited pages or just are not very user friendly.
When is the last time you logged in just to read an article that you saved just for that purpose? My best bet is you havent!
With BucketRead you can easily read the next page in your list with just 2-clicks!

Features?
---------

Not many. Simplicity is key.

- A web interface
- A Chrome extension

Whats upcoming?
---------------

- The BucketRead Android app so you can read saved articles on the go.
- Support for FireFox will be upcoming.

Twitter API Authentication
--------------------------
1. For all requests:
	httpMethod + "&" +
  	url_encode(  base_uri ) + "&" +
	sorted_query_params.each  { | k, v |
		url_encode ( k ) + "%3D" +
		url_encode ( v )
	}.join("%26")
2. Acquire request token: http://api.twitter.com/oauth/request_token
	- URL encode everything
	- POST&https%3A%2F%2Fapi.twitter.com%2Foauth%2Frequest_token&oauth_callback%3Dhttp%253A%252F%252Flocalhost%253A3005%252Fthe_dance%252Fprocess_callback%253Fservice_provider_id%253D11%26oauth_consumer_key%3DGDdmIQH6jhtmLUypg82g%26oauth_nonce%3DQP70eNmVz8jvdPevU3oJD2AfF7R7odC2XJcn4XlZJqk%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1272323042%26oauth_version%3D1.0
3. 