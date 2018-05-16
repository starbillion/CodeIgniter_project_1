<?php
defined('BASEPATH') OR exit('No direct script access allowed');

include APPPATH.'third_party/Braintree.php';

/*
 *  Braintree_lib
 *  Braintree PHP SDK v3.*
 *  For Codeigniter 3.*
 */

class Braintree_lib{
 
        function __construct() {
            $CI = &get_instance();
            $CI->config->load('braintree', TRUE);
            $braintree = $CI->config->item('braintree');        
            Braintree_Configuration::environment($braintree['braintree_environment']);
            Braintree_Configuration::merchantId($braintree['braintree_merchant_id']);
            Braintree_Configuration::publicKey($braintree['braintree_public_key']);
            Braintree_Configuration::privateKey($braintree['braintree_private_key']);
        }

    function create_client_token(){
        $clientToken = Braintree_ClientToken::generate();
        return $clientToken;
    }

    function transaction_sale($amount,$nonce){
         return $result = Braintree_Transaction::sale([
            'amount' => $amount,
            'paymentMethodNonce' => $nonce,
            'options' => [
                'submitForSettlement' => true
                ]
            ]);
    }

    function clone_transaction($amount,$transaction_id){
         return $result = Braintree_Transaction::cloneTransaction($transaction_id, [
                  'amount' => $amount,
                  'options' => [
                    'submitForSettlement' => true
                  ]
                ]);
    }

        function sale_transaction($sale){
      return $result = Braintree_Transaction::sale($sale);
    }
}