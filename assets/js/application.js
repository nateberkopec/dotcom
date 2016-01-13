/* bling.js */

window.$ = document.querySelectorAll.bind(document);

Node.prototype.on = window.on = function (name, fn) {
  this.addEventListener(name, fn);
};

if (!Object.setPrototypeOf) {
  Object.setPrototypeOf = function(obj, proto) {
    obj.__proto__ = proto;
    return obj;
  };
}

Object.setPrototypeOf(NodeList.prototype, Array.prototype);

NodeList.prototype.on = NodeList.prototype.addEventListener = function (name, fn) {
  this.forEach(function (elem, i) {
    elem.on(name, fn);
  });
};

function ready(fn) {
  if (document.readyState != 'loading'){
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}



ready( function () {
  var gif = [];
  var elements = $('figure.animated_gif_frame img');

  Array.prototype.forEach.call(elements, function(n, i) {
    console.log(n,i);
    var currentSrc = n.getAttribute('src')
    var newSrc = currentSrc.replace(/\.(png|jpg)$/,'.gif');
    gif.push(newSrc);
    n.setAttribute('data-source', newSrc);
    n.setAttribute('data-alt', newSrc);
    n.on('click', function() {
      var $img = this,
          imgSrc = $img.getAttribute('src'),
          imgAlt = $img.getAttribute('data-source'),
          imgExt = imgAlt.replace(/^.*?\.(\w+)$/,'$1');

      if(imgExt === 'gif') {
          $img.setAttribute('src', $img.getAttribute('data-alt'));
          $img.setAttribute('data-source', imgSrc);
          var parent = $img.parentNode
          if (parent.classList)
            parent.classList.add('playing');
          else
            parent.className += ' ' + 'playing';
      } else {
          $img.setAttribute('src', imgAlt);
          $img.setAttribute('data-source', $img.getAttribute('data-alt'));
          var parent = $img.parentNode
          if (parent.classList)
            parent.classList.remove('playing');
          else
            parent.className = parent.className.replace('playing', ' ');
      }
    });
  });
});
