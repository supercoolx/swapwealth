@extends('admin.layouts.app')

@section('panel')
    <div class="row mb-none-30">


        <div class="col-lg-12 col-md-12 mb-30">
            <div class="card b-radius--10 overflow-hidden box--shadow1">
                <div class="card-body">

                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Date')
                            <span class="font-weight-bold">{{ showDateTime($withdrawal->created_at) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Wallet Address')
                            <span class="font-weight-bold">{{ $withdrawal->wallet_address }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Trx Number')
                            <span class="font-weight-bold">{{ $withdrawal->trx }}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Username')
                            <span class="font-weight-bold">
                                <a href="{{ route('admin.users.detail', $withdrawal->user_id) }}">{{ @$withdrawal->user->username }}</a>
                            </span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Amount')
                            <span class="font-weight-bold">{{ showAmount($withdrawal->amount,8) }} {{ __($withdrawal->crypto->code) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Charge')
                            <span class="font-weight-bold">{{ showAmount($withdrawal->charge,8) }} {{ __($withdrawal->crypto->code) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Payable')
                            <span class="font-weight-bold">{{ showAmount($withdrawal->payable,8 ) }} {{ __($withdrawal->crypto->code) }}</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            @lang('Status')
                            @if($withdrawal->status == 2)
                                <span class="badge badge-pill bg--warning">@lang('Pending')</span>
                            @elseif($withdrawal->status == 1)
                                <span class="badge badge-pill bg--success">@lang('Approved')</span>
                            @elseif($withdrawal->status == 3)
                                <span class="badge badge-pill bg--danger">@lang('Rejected')</span>
                            @endif
                        </li>

                        @if ($withdrawal->status == 2)
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                @lang('Action')
                                <span>
                                    <button class="icon-btn btn--success approveBtn" data-toggle="tooltip" data-original-title="@lang('Approve')"
                                            data-id="{{ $withdrawal->id }}" data-amount="{{ showAmount($withdrawal->payable,8) }} {{$withdrawal->crypto->code}}">
                                        <i class="fas la-check"></i> @lang('Approve')
                                    </button>

                                    <button class="icon-btn btn--danger rejectBtn" data-toggle="tooltip" data-original-title="@lang('Reject')"
                                            data-id="{{ $withdrawal->id }}" data-amount="{{ showAmount($withdrawal->payable,8) }} {{__($withdrawal->crypto->code)}}">
                                        <i class="fas fa-ban"></i> @lang('Reject')
                                    </button>
                                </span>
                            </li>
                        @endif

                        @if($withdrawal->admin_feedback)
                            <li class="list-group-item">
                                <strong>@lang('Admin Response')</strong>
                                <br>
                                <p>{{$withdrawal->admin_feedback}}</p>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>



    {{-- APPROVE MODAL --}}
    <div id="approveModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Approve Withdrawal Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('admin.withdraw.approve') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <p>@lang('Have you sent') <span class="font-weight-bold withdraw-amount text-success"></span>?</p>
                        <p class="withdraw-detail"></p>
                        <textarea name="details" class="form-control pt-3" rows="3" placeholder="@lang('Provide the details. eg: transaction number')" required=""></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn--dark" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn--success">@lang('Approve')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {{-- REJECT MODAL --}}
    <div id="rejectModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Reject Withdrawal Confirmation')</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{route('admin.withdraw.reject')}}" method="POST">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <strong>@lang('Reason of Rejection')</strong>
                        <textarea name="details" class="form-control pt-3" rows="3" placeholder="@lang('Provide the Details')" required=""></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn--dark" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn--danger">@lang('Reject')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        (function ($) {
            "use strict";
            $('.approveBtn').on('click', function() {
                var modal = $('#approveModal');
                modal.find('input[name=id]').val($(this).data('id'));
                modal.find('.withdraw-amount').text($(this).data('amount'));
                modal.modal('show');
            });

            $('.rejectBtn').on('click', function() {
                var modal = $('#rejectModal');
                modal.find('input[name=id]').val($(this).data('id'));
                modal.find('.withdraw-amount').text($(this).data('amount'));
                modal.modal('show');
            });
        })(jQuery);

    </script>
@endpush
