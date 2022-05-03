@extends($activeTemplate.'layouts.frontend')
@section('content')

    @include($activeTemplate.'partials.breadcrumb')

    <section class="pt-120 pb-120 section--bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                  <div class="custom--card">
                    <div class="card-header border-bottom-0 text-center">
                        <ul class="btn-list justify-content-center">
                            <li><a href="{{route('user.wallets')}}" class="btn btn-sm btn-outline--base @if(!request()->id) active @endif">@lang('All')</a></li>
                            @foreach ($wallets as $wallet)
                                <li>
                                    <a href="{{route('user.wallets.single',[$wallet->crypto->id,$wallet->crypto->code])}}" class="btn btn-sm btn-outline--base @if(request()->id == $wallet->crypto->id) active @endif"><span>{{$wallet->crypto->code}}</span> ( {{ $cryptoWallets->where('crypto_id',$wallet->crypto_id)->count()}} )  {{showAmount($wallet->balance,8)}}</a>
                                </li>
                            @endforeach
                        </ul>

                        @foreach ($wallets as $wallet)
                            @if(Request::routeIs('user.wallets.single'))
                                @if ($crypto->id == $wallet->crypto->id)
                                    <div class="text-center mt-4">
                                        <h4>@lang('Deposit Charge is') @if($wallet->crypto->dc_fixed > 0) {{$wallet->crypto->dc_fixed}} {{$wallet->crypto->code}} +  @endif {{$wallet->crypto->dc_percent}}%</h4>
                                    </div>

                                    <div class="mt-2 d-flex flex-wrap justify-content-center">

                                        <a href="{{route('user.wallets.generate',$wallet->crypto->code)}}" class="link-btn m-2"><i class="las la-plus"></i> @lang('Generate New') {{$wallet->crypto->code}} @lang('Address')</a>

                                        <a href="{{route('user.withdraw',$wallet->crypto->code)}}" class="link-btn m-2"><i class="las la-credit-card"></i> @lang('Withdraw') {{$wallet->crypto->code}}</a>

                                    </div>
                                @endif
                            @endif
                        @endforeach
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive table-responsive--md">
                          <table class="table custom--table mb-0">
                            <thead>
                              <tr>
                                <th>@lang('Currency')</th>
                                <th>@lang('Generated at')</th>
                                <th>@lang('Wallet Address')</th>
                                <th>@lang('Action')</th>
                              </tr>
                            </thead>
                            <tbody>
                                  @forelse ($cryptoWallets as $cryptoWallet)
                                      <tr>
                                        <td data-label="@lang('Currency')">{{$cryptoWallet->crypto->code}}</td>
                                        <td data-label="@lang('Generated at')">{{showDateTime($cryptoWallet->created_at)}}</b></td>
                                        <td data-label="@lang('Wallet Address')">{{$cryptoWallet->wallet_address}}</td>
                                        <td data-label="@lang('Action')">
                                            <a href="javascript:void(0)" class="cmn-btn btn-sm copy-address" data-clipboard-text="{{$cryptoWallet->wallet_address}}"><i class="las la-copy"></i>@lang('Copy Address')</a>
                                        </td>
                                      </tr>
                                  @empty
                                      <tr>
                                          <td colspan="100%" class="text-center">{{__($emptyMessage)}}</td>
                                      </tr>
                                  @endforelse
                            </tbody>
                          </table>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="row">
                {{ $cryptoWallets->links() }}
            </div>
        </div>
    </section>
@endsection

@push('script-lib')
    <script src="{{asset($activeTemplateTrue.'js/clipboard.min.js')}}"></script>
@endpush

@push('script')
    <script>
        (function($){
            "use strict";

            $('.copy-address').on('click',function () {
                var clipboard = new ClipboardJS('.copy-address');
                notify('success','Copied : '+$(this).data('clipboard-text'))
            })
        })(jQuery);
    </script>
@endpush
