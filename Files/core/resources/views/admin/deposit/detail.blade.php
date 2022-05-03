@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-xl-12 col-md-12 mb-30">
            <div class="card b-radius--10 overflow-hidden box--shadow1">
                <div class="card-body">

                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Date')
                            <span class="font-weight-bold">{{ showDateTime($deposit->created_at) }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Wallet Address')
                            <span class="font-weight-bold">{{ $deposit->wallet_address }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Transaction Number')
                            <span class="font-weight-bold">{{ $deposit->trx }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Coin Payment Transaction Number')
                            <span class="font-weight-bold">{{ $deposit->cp_trx }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Username')
                            <span class="font-weight-bold">
                                <a href="{{ route('admin.users.detail', $deposit->user_id) }}">{{ @$deposit->user->username }}</a>
                            </span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Amount')
                            <span class="font-weight-bold">{{ showAmount($deposit->amount,8 ) }} {{ __($deposit->crypto->code) }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Charge')
                            <span class="font-weight-bold">{{ showAmount($deposit->charge,8 ) }} {{ __($deposit->crypto->code) }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('After Charge')
                            <span class="font-weight-bold">{{ showAmount($deposit->amount + $deposit->charge,8 ) }} {{ __($deposit->crypto->code) }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Payable')
                            <span class="font-weight-bold">{{ showAmount($deposit->final_amo,8 ) }} {{__($deposit->crypto->code)}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Status')
                            @if($deposit->status == 1)
                                <span class="badge badge-pill bg--success">@lang('Approved')</span>
                            @else
                            @endif
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
@endsection
