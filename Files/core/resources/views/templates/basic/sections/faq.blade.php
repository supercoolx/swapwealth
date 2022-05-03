@php
    $faqContent = getContent('faq.content',true);
    $faqElements = getContent('faq.element');
@endphp

<section class="pt-120 pb-120">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="section-header text-center">
            <h2 class="section-title">{{__(@$faqContent->data_values->heading)}}</h2>
            <p>{{__(@$faqContent->data_values->heading)}}</p>
          </div>
        </div>
      </div><!-- row end -->
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="accordion cmn-accordion" id="accordionExample">

                @foreach ($faqElements as $item)
                  @if($loop->even)
                    <div class="card">
                        <div class="card-header" id="h-{{$loop->index+1}}">
                            <button class="btn btn-link btn-block text-left @if(!$loop->first) collapsed @endif" type="button" data-toggle="collapse" data-target="#c-{{$loop->index+1}}" aria-expanded="true" aria-controls="c-{{$loop->index+1}}">
                                <i class="las la-question-circle"></i>
                                <span>{{__(@$item->data_values->question)}}</span>
                            </button>
                        </div>

                        <div id="c-{{$loop->index+1}}" class="collapse" aria-labelledby="h-{{$loop->index+1}}" data-parent="#accordionExample">
                        <div class="card-body">
                            <p>{{__(@$item->data_values->answer)}}</p>
                        </div>
                        </div>
                    </div>
                  @endif
                @endforeach
          </div>
        </div>
        <div class="col-lg-6 mt-lg-0 mt-4">
          <div class="accordion cmn-accordion" id="accordionExample">

                @foreach ($faqElements as $item)
                  @if($loop->odd)
                    <div class="card">
                        <div class="card-header" id="h-{{$loop->index+1}}">
                            <button class="btn btn-link btn-block text-left @if(!$loop->first) collapsed @endif" type="button" data-toggle="collapse" data-target="#c-{{$loop->index+1}}" aria-expanded="true" aria-controls="c-{{$loop->index+1}}">
                                <i class="las la-question-circle"></i>
                                <span>{{__(@$item->data_values->question)}}</span>
                            </button>
                        </div>

                        <div id="c-{{$loop->index+1}}" class="collapse" aria-labelledby="h-{{$loop->index+1}}" data-parent="#accordionExample">
                        <div class="card-body">
                            <p>{{__(@$item->data_values->answer)}}</p>
                        </div>
                        </div>
                    </div>
                  @endif
                @endforeach

          </div>
        </div>
      </div>
    </div>
</section>
