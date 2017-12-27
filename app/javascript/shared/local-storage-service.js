class LocalStorageService {
  constructor() {
    if (window.localStorage == 'undefined') {
      return new Error("Please use a browser that supports local storage");
    }

    this.localStorage = window.localStorage;
  }

  hasKey(key) {
    return this.localStorage.hasOwnProperty(key);
  }

  fetch(key) {
    return this.localStorage.getItem(key);
  }

  set(key, value) {
    this.localStorage.setItem(key, value);
  }

  delete(key) {
    this.localStorage.removeItem(key);
  }

  clear() {
    this.localStorage.clear();
  }

  allKeys() {
    return this.localStorage.valueOf();
  }
}

export default new LocalStorageService();