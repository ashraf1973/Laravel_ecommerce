<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblShippingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_shipping', function (Blueprint $table) {
             $table->increments('shipping_id');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('company_name');
            $table->string('email_address');
           //$table->string('password');
            ///$table->string('admin_password');
            $table->text('address');
            $table->string('city');
            $table->string('mobile_number');
            $table->string('zip_code');
            $table->string('country');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_shipping');
    }
}
