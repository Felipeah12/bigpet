// Scroll
window.scrollTo({top: 0, behavior: 'smooth'});

// Define variables
let name = email = phone = subject = message = password = password_confirmation = null;

// use for change message of validation in required data.
const field_required = (empty_input) => {
  empty_input.value == '' ? empty_input.setCustomValidity('Campo requerido!') : empty_input.setCustomValidity('');
  return true;
}

const validate_input = (object) => {
  object.addEventListener("invalid", () => {
    field_required(object);
  });

  object.addEventListener("input", () => {
    field_required(object);
  });
}

// Use to login view
document.addEventListener('DOMContentLoaded', () => {
  let btn_top = document.getElementById('btn-top-body');

  if(btn_top){
    btn_top.addEventListener('click', () => {
      window.scrollTo({top: 0, behavior: 'smooth'});
    })
  }

  if(document.getElementById('user_current_password')){
    let current_password = document.getElementById('user_current_password');

    if(current_password){ validate_input(current_password); }
  }

  // use for change message of validation in required data.
  if(document.getElementById('contact_name')){
    name = document.getElementById('contact_name')
    email = document.getElementById('contact_email')
    subject = document.getElementById('contact_subject')
    message = document.getElementById('contact_message')
  }
  else if(document.getElementById('leed_email')){
    email = document.getElementById('leed_email');
  }
  else{
    name = document.getElementById('user_name');
    email = document.getElementById('user_email');
    phone = document.getElementById('user_phone');
    password = document.getElementById('user_password');
    password_confirmation = document.getElementById('user_password_confirmation');
  }

  if(name){ validate_input(name); }
  if(email){ validate_input(email); }
  if(phone){ validate_input(phone); }
  if(subject){ validate_input(subject); }
  if(message){ validate_input(message); }
  if(password){ validate_input(password); }
  if(password_confirmation){ validate_input(password_confirmation); }
});

// Use to brands form
document.addEventListener('DOMContentLoaded', function(){
  // use for change message of validation in required data.
  if(document.getElementById('brand_name')){
    let name = document.getElementById('brand_name'),
        type = document.getElementById('brand_size_type'),
        pet = document.getElementById('brand_kind_of_pet'),
        min_width = document.getElementById('brand_min_width'),
        max_width = document.getElementById('brand_max_width'),
        gram_amount = document.getElementById('brand_gram_amount'),
        price = document.getElementById('brand_price');
    
      if(pet){ validate_input(pet); }
      if(name){ validate_input(name);}
      if(type){ validate_input(type); }
      if(price){ validate_input(price); }
      if(min_width){ validate_input(min_width); }
      if(max_width){ validate_input(max_width); }
      if(gram_amount){ validate_input(gram_amount); }
  }
});

// Use to News form
document.addEventListener('DOMContentLoaded', function(){
  // use for change message of validation in required data.
  if(document.getElementById('newsletter_title')){
    let title = document.getElementById('newsletter_title'),
        content = document.getElementById('newsletter_content');
    
      if(title){ validate_input(title); }
      if(content){ validate_input(content); }
  }
});

// Use to Suggestions form
document.addEventListener('DOMContentLoaded', function(){
  // use for change message of validation in required data.
  if(document.getElementById('suggestion_email')){
    let email = document.getElementById('suggestion_email'),
        phone = document.getElementById('suggestion_phone'),
        question = document.getElementById('suggestion_question');
    
      if(email){ validate_input(email); }
      if(phone){ validate_input(phone); }
      if(question){ validate_input(question); }
  }

  // use for change message of validation in required data.
  if(document.getElementById('message')){
    let message = document.getElementById('message');

    if(message){ validate_input(message); }
  }
});

// Use to News form
document.addEventListener('DOMContentLoaded', function(){
  // use for change message of validation in required data.
  if(document.getElementById('user_address')){
    let address = document.getElementById('user_address'),
        birthdate = document.getElementById('user_birthdate');
    
      if(address){ validate_input(address); }
      if(birthdate){ validate_input(birthdate); }
  }

  // const active_radio = (radio) => {
  //   if (radio.previous)
  //     radio.checked = false;
  // }

  // document.querySelectorAll('.radio-kind').forEach(item => {
  //   item.addEventListener('click', (event) => {
  //     console.log(event.target)
  //     active_radio(item)
  //   })
  // });

  let collapsibles = document.getElementsByClassName('collapsible');

  if(collapsibles){
    for (let i = 0; i < collapsibles.length; i++) {
      collapsibles[i].addEventListener('click', () => {
        collapsibles[i].classList.toggle('active-filters');
        let content = collapsibles[i].nextElementSibling;

        if (content.style.maxHeight)
          content.style.maxHeight = null;
        else
          content.style.maxHeight = content.scrollHeight + "px";
      });
    }
  }
});

// Use to Suggestions form
document.addEventListener('DOMContentLoaded', function(){
  // use for change message of validation in required data.
  if(document.getElementById('order_address')){
    let address = document.getElementById('order_address'),
        months = document.getElementById('order_months');
    
      if(address){ validate_input(address); }
      if(months){ validate_input(months); }
  }
});
