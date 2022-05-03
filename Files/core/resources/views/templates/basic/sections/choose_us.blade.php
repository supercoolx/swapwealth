@php
    $chooseContent = getContent('choose_us.content',true);
    $chooseElements = getContent('choose_us.element');
@endphp
<section class="why-choose-section pt-120 pb-120 bg_img overlay--one" data-background="{{ getImage('assets/images/frontend/choose_us/'.@$chooseContent->data_values->image,'1920x1080') }}">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="section-header text-center">
            <h2 class="section-title text-white">{{__(@$chooseContent->data_values->heading)}}</h2>
            <p class="text-white">{{__(@$chooseContent->data_values->sub_heading)}}</p>
          </div>
        </div>
      </div><!-- row end -->
      <div class="row mb-none-50">
        @foreach ($chooseElements as $item)
            <div class="col-lg-4 col-md-6 mb-30">
                <div class="choose-card">
                    <div class="choose-card__icon">
                        <img src="{{ getImage('assets/images/frontend/choose_us/'.@$item->data_values->image,'50x50') }}" alt="image">
                    </div>
                    <div class="choose-card__content">
                        <h5 class="title mb-3">{{__(@$item->data_values->heading)}}</h5>
                        <p>{{__(@$item->data_values->details)}}</p>
                    </div>
                </div>
            </div>
        @endforeach
      </div>
    </div>
  </section>
