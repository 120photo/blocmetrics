# Blocmetrics App

General purpose analytics service that your customers can use to track events on their websites. Build as part of my [bloc.io](https://www.bloc.io) course.

1. Sign up for account.
2. Add a site.
3. Add generated meta tag to the ```<head>``` section of you index.
4. Click the 'Verify' link to verify you own site.
5. Place the following javacript right before the closing ```</body> tag.


```javascript
<script>
var blocmetrics = (function (args) {

var _bm_event = {
  name: "some event",
  property_1: "some value",
  property_2: "some other value"
}

var _bm_request = new XMLHttpRequest();
_bm_request.open("POST", "http://mydomain.com/events.json", true);
_bm_request.setRequestHeader('Content-Type', 'application/json');
_bm_request.onreadystatechange = function() {
  // this function runs when the Ajax request changes state.
  // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
};
_bm_request.send(JSON.stringify(_bm_event));

}( blocmetrics(args) ));
</script>
```
