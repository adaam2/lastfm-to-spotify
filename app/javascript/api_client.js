const request = require('superagent');
const baseUri = "http://localhost:3000";

class ApiClient {
  constructor(baseUri) {
    this.baseUri = baseUri;
  }

  get(path, params = {}) {
    return request.get(this.requestUrl(path), params);
  }

  post(path, body = {}) {
    return request.post(this.requestUrl(path), body);
  }

  delete(path, params = {}) {
    return request.delete(this.requestUrl(path), params);
  }

  patch(path, body = {}) {
    return request.patch(this.requestUrl(path), body);
  }

  requestUrl(path) {
    return `${this.baseUri}/${path}`;
  }
}

export default new ApiClient(baseUri);
