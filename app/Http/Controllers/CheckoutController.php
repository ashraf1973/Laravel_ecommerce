<?php

namespace App\Http\Controllers;

use DB;
use Session;
use Cart;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;

class CheckoutController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkout() {
        $checkout_page = view('pages.checkout');
        return view('master')
                        ->with('content', $checkout_page);
    }

    public function save_customer(Request $request) {
        $data = array();
        $data['first_name'] = $request->first_name;
        $data['last_name'] = $request->last_name;
        $data['company_name'] = $request->company_name;
        $data['email_address'] = $request->email_address;
        $data['password'] = md5($request->password);
        $data['address'] = $request->address;
        $data['mobile'] = $request->mobile;
        $data['city'] = $request->city;
        $data['zip_code'] = $request->zip_code;
        $data['country'] = $request->country;

        $customer_id = DB::table('tbl_customer')->insertGetId($data);
        Session::put('customer_id', $customer_id);
        return Redirect::to('/shipping-address');
    }

    public function shipping_address() {
        $shipping_page = view('pages.shipping');
        return view('master')
                        ->with('content', $shipping_page);
    }

    public function save_shipping(Request $request) {
        $data = array();
        $data['first_name'] = $request->first_name;
        $data['last_name'] = $request->last_name;
        $data['company_name'] = $request->company_name;
        $data['email_address'] = $request->email_address;
        //$data['password']=  md5($request->password);
        $data['address'] = $request->address;
        $data['city'] = $request->city;
        $data['mobile_number'] = $request->mobile_number;
        $data['zip_code'] = $request->zip_code;
        $data['country'] = $request->country;

        $shipping_id = DB::table('tbl_shipping')->insertGetId($data);
        Session::put('shipping_id', $shipping_id);
        return Redirect::to('/payment');
    }

    public function payment() {
        $payment_page = view('pages.confirm_order');
        return view('master')
                        ->with('content', $payment_page);
    }

    public function place_order(Request $request) {
        $payment_type = $request->payment_type;
        $data = array();
        $data['payment_type'] = $payment_type;
        $payment_id = DB::table('tbl_payment')->insertGetId($data);

        /*
         * start order save
         */
        $odata = array();
        $odata['customer_id'] = Session::get('customer_id');
        $odata['shipping_id'] = Session::get('shipping_id');
        $odata['payment_id'] = $payment_id;
        $order_total = str_replace(",", "", Cart::total());
        $odata['order_total'] = $order_total;
        $order_id = DB::table('tbl_order')->insertGetId($odata);

        /*
         * end order   save
         */

        /*
         * start order_details  save
         */

        $oddata = array();
        $contents = Cart::content();

        foreach ($contents as $v_contents) {
            $oddata['order_id'] = $order_id;
            $oddata['product_id'] = $v_contents->id;
            $oddata['product_name'] = $v_contents->name;
            $oddata['product_price'] = $v_contents->price;
            $oddata['product_sales_quantity'] = $v_contents->qty;
            DB::table('tbl_order_details')->insert($oddata);
        }

        /*
         * end order details save
         */

        if ($payment_type == 'paypal') {
            return view('pages.htmlWebsiteStandardPayment');
        }
        if ($payment_type == 'cash_on_delivery') {
            Cart::destroy();
            return Redirect::to('order-successfull');
        }
    }

    public function order_successfull() {
         $successfull_page = view('pages.successfull_order');
        return view('master')
                        ->with('content', $successfull_page);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

}
