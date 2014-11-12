// Blocmetrics.track(api_key, event_name, {attr1:...., attr2: ...})

var Blocmetrics = {
  track: function(api_key, event_name, event_data) {
    var _bm_event = {
      name: event_name,
      data: event_data
    }

    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "http://mydomain.com/events.json", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    _bm_request.onreadystatechange = function() {
      // this function runs when the Ajax request changes state.
      // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
    };
    _bm_request.send(JSON.stringify(_bm_event));

  }
}
