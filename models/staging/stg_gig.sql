
SELECT a.*
FROM 
{{ ref('raw_events') }} as a

WHERE 1=1
AND type IN (   'gigs.autounburied',
                'gigs.autoburied',
                'gig_create.success',
                'gigs.show_as_handpicked.success',
                'gigs.unbury.success',
                'package.edit',
                'gigs.bury.success',
                'convert_gig_to_pro.on',
                'gigs.shady.success',
                'gig_update.success',
                'gig_publish.success',
                'gig_subscription_updated',
                'predicted_handpicks.enqueue')
                
OR "GROUP" IN ( 'gig_creation_funnel',
                'pricing_factors' )  